package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProductInfoService;
import service.ProductInfoServiceImpl;
import vo.ProductInfoDTO;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ProductInfoController
 */
//@WebServlet("/makeAccoutSelect.do")

@WebServlet("/apiTest/view/makeAccountSelect.do")



public class ProductInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	    if (command.equals("/apiTest/view/makeAccountSelect.do")) {
	        ProductInfoService service = new ProductInfoServiceImpl();
	        List<ProductInfoDTO> dtos = service.getProductList();
	        request.setAttribute("productlist", dtos);

	        viewPage = "/view/makeAccountSelect.jsp";

	        // 포워딩
	        RequestDispatcher reqDpt = request.getRequestDispatcher(viewPage);
	        reqDpt.forward(request, response);
	    }
	}

	
}
