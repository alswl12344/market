/*
 * Controller는 Service를 호출한다.
 * view -> 리턴
 * 
 */

package kr.co.dong.emp;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Empcontroller {

	@Inject
	private EmpService service;
	
	@RequestMapping(value="/empcount")
	public String empCount(Model model) throws Exception{
		int count = service.empCount();
		model.addAttribute("cnt",count);
		return "home";
	}
	
}
