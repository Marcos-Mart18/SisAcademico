package pe.edu.upeu.academico.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.academico.dao.UsuarioDao;
import pe.edu.upeu.academico.daoImpl.UsuarioDaoImpl;
import pe.edu.upeu.academico.dto.UsuariLogin;

public class LoginController extends HttpServlet {
    private UsuarioDao udao = new UsuarioDaoImpl();
    private static final int MAX_ATTEMPTS = 3;
    private static final Map<String, Integer> failedAttemptsMap = new HashMap<>();
    private static final Map<String, Boolean> isBlockedMap = new HashMap<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String clave = request.getParameter("clave");
        HttpSession sesion = request.getSession();

        // Obtener el contador de intentos fallidos y el estado de bloqueo del mapa
        Integer failedAttempts = failedAttemptsMap.get(username);
        Boolean isBlocked = isBlockedMap.get(username);
        
        if (failedAttempts == null) {
            failedAttempts = 0;
        }
        if (isBlocked == null) {
            isBlocked = false;
        }

        // Verificar si el usuario está bloqueado
        if (isBlocked) {
            out.println("<html><body>");
            out.println("<script type='text/javascript'>");
            out.println("alert('Su cuenta ha sido bloqueada. Comuníquese con el administrador.');");
            out.println("window.location.href = 'index.jsp';");
            out.println("</script>");
            out.println("</body></html>");
            return;
        }

        List<UsuariLogin> lista = udao.login(username, clave);
        if (!lista.isEmpty()) { 
            sesion.setAttribute("username", lista.get(0).getUsername());
            sesion.setAttribute("rol", lista.get(0).getRol());
            failedAttemptsMap.remove(username); // Reiniciar el contador de intentos fallidos
            isBlockedMap.remove(username); // Reiniciar el estado de bloqueo
            response.sendRedirect("home.jsp");
        } else {
            failedAttempts++;
            failedAttemptsMap.put(username, failedAttempts);

            if (failedAttempts >= MAX_ATTEMPTS) {
                isBlockedMap.put(username, true);
                out.println("<html><body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Su cuenta ha sido bloqueada. Comuníquese con el administrador.');");
                out.println("window.location.href = 'index.jsp';");
                out.println("</script>");
                out.println("</body></html>");
            } else {
                out.println("<html><body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Nombre de usuario o clave incorrectos. Intentos fallidos: " + failedAttempts + "');");
                out.println("window.location.href = 'index.jsp';");
                out.println("</script>");
                out.println("</body></html>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}