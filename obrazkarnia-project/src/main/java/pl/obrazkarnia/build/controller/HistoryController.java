package pl.obrazkarnia.build.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.obrazkarnia.build.service.UserService;

@Controller
public class HistoryController {

	@Autowired
	UserService userService;
	
    @RequestMapping("/history")
    public String history(Model model, Principal principal) {
    	
    	String name = principal.getName();
		model.addAttribute("user", userService.findOneWithBlogs(name));
    	
        return "history";
    }
}
