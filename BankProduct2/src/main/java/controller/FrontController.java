package controller;

import java.io.IOException;

import daodto.AccountDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.accountCommand;
import model.checkIdCommand;
import model.enrollmentCommand;
import model.joinCommand;
import model.kakaoLoginCommand;
import model.loginCommand;
import model.mailCommand;
import model.memberCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        actionDo(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        actionDo(request, response);
    }



    private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String viewPage = null;
        String uri = request.getRequestURI();
        System.out.println("uri : " + uri);

        String conPath = request.getContextPath();
        System.out.println("conPath : " + conPath);

        String command = uri.substring(conPath.length());
        System.out.println("command : " + command);

//        if (command.equals("/view/kakaoLogin.do")) {
//
//            System.out.println("kakaoLogin.do");
//            accountCommand mc = new kakaoLoginCommand();
//            mc.execute(request, response);
//
//        }
/*        else if(command.equals("/view/mail.do")) {
        	accountCommand mc = new mailCommand();
            mc.execute(request, response);
            
            System.out.println("mail.do");
            viewPage = "join.jsp";
        }*/
        if(command.equals("/view/enrollment.do")) {
        	accountCommand mc = new enrollmentCommand();
            mc.execute(request, response);

            viewPage = "enrollmentOk.jsp";
        }
        
        else if(command.equals("/view/beforenroll.do")) {
        	// accountCommand 를 동일하게 써도 되는지 고민 
        	accountCommand mc = new enrollmentCommand();
        	mc.execute(request, response);
        	
            // checkAccount 호출
            AccountDao dao = new AccountDao();
            String memberId = request.getParameter("memberId");
            Boolean hasAccount = dao.hasAccount(memberId);
            
            // has Account 값에 따라 type 설정
            if (!hasAccount) {
            	request.setAttribute("type", "입출금계쫘");
        }
            
            viewPage = "enrollment.jsp";
        }
        
        
        /* 
         *   // has Account 값에 따라 type 설정
    String type = request.getParameter("productType");
    if (!hasAccount) {
        type = "입출금계쫘";
    }
    request.setAttribute("type", type);
    
    viewPage = "enrollment.jsp";
}
         * */
        
        
        else if(command.equals("/view/login.do")) {
        	accountCommand mc = new loginCommand();
            mc.execute(request, response);
            viewPage = "loginOk.jsp";
        }
        else if(command.equals("/view/checkDuplicateId.do")) {
        	accountCommand mc = new checkIdCommand();
            mc.execute(request, response);
            
        // 포워딩
//        RequestDispatcher reqDpt = request.getRequestDispatcher(viewPage);
//        reqDpt.forward(request, response);
        
    }
}
