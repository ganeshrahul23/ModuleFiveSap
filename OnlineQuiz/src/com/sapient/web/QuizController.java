package com.sapient.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sapient.service.ExamSerImpl;
import com.sapient.service.IExamSer;
import com.sapient.util.ExamUtil;
import com.sapient.vo.Answer;
import com.sapient.vo.Question;

public class QuizController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IExamSer ser = ExamSerImpl.getInstance();
		
    public QuizController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		RequestDispatcher rd = null;
		String view = null;		
		switch (url) {
		case "/OnlineQuiz/start":
			view = startExam(request);
			break;
		case "/OnlineQuiz/quiz":
			view = getNextPrevFinish(request);
			break;			
		default:
			break;
		}
		rd = request.getRequestDispatcher(response.encodeURL(view));
		rd.forward(request, response);
	}
	
	private String startExam(HttpServletRequest request){
		ServletConfig cfg = getServletConfig();
		int noOfQuestions = Integer.parseInt(cfg.getInitParameter("pquestions"));
		ServletContext ctx = getServletContext();
		ctx.setAttribute("size", noOfQuestions);		
		List<Question> qList = ser.generateQuestions(noOfQuestions);
		Map<Integer, Answer> aMap = new HashMap<>();
		HttpSession sess = request.getSession();
		sess.setAttribute("ansMap", aMap);
		sess.setAttribute("quesList", qList);
		sess.setAttribute("curridx", 0);
		request.setAttribute("question", qList.get(0));
		String view = "QuizView.jsp";
		return view;
	}
		
	private String getNextPrevFinish(HttpServletRequest request){		
		HttpSession sess = request.getSession();
		List<Question> qList = (List<Question>) sess.getAttribute("quesList");
		int currQues = (int) sess.getAttribute("curridx");
		String btn = request.getParameter("btn");
		
		Map<Integer, Answer> aMap = (Map<Integer, Answer>) sess.getAttribute("ansMap");
		int qId = Integer.parseInt(request.getParameter("quesId"));
		String ans = request.getParameter("ques");
		Answer obj = new Answer(qId, ans);
		aMap.put(qId, obj);
		sess.setAttribute("ansMap", aMap);
		String view = null;
		if(btn.equals("next")){
				sess.setAttribute("curridx", ++currQues);
				request.setAttribute("question", qList.get(currQues));
				view = "QuizView.jsp";
		}
		else if(btn.equals("prev")){
				sess.setAttribute("curridx", --currQues);
				request.setAttribute("question", qList.get(currQues));
				view = "QuizView.jsp";
		}else if(btn.equals("finish")){
			   List<Answer> aList = new ArrayList<>();
			   aList.addAll(aMap.values());
			   int score = ser.evaluate(aList);
			   request.setAttribute("score", score);
			   view = "QuizScore.jsp";
		}	
		return view;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
