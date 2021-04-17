package danhnlc.controller;

import danhnlc.dao.AnswerDAO;
import danhnlc.dao.QuestionDAO;
import danhnlc.dto.AnswerDTO;
import danhnlc.dto.QuestionDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "MainController?btnAction=Update_Page";
        try {
            String id = request.getParameter("questionId");
            String index = request.getParameter("index");
            
            QuestionDAO questionDAO = new QuestionDAO();
            AnswerDAO answerDAO = new AnswerDAO();
            QuestionDTO questionDTO = questionDAO.getQuestionById(id);
            List<AnswerDTO> answerList = answerDAO.getAnswerListByQuestionId(Integer.parseInt(id));
            
            int i = 1;
            for (AnswerDTO x : answerList) {
                request.setAttribute("txtAnswer" + i, x);
                ++i;
            }
            
            request.setAttribute("question", questionDTO);
            request.setAttribute("index", index);
            request.setAttribute("subject", questionDTO.getSubject());
            request.setAttribute("status", questionDTO.getStatus());
            request.setAttribute("subjectSelection", null);
            request.setAttribute("statusSelection", null);
            
        } catch (Exception e) {
            log("Error at EditController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}