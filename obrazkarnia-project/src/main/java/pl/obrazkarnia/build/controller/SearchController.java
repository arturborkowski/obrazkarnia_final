package pl.obrazkarnia.build.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import pl.obrazkarnia.build.service.HistoryService;
import pl.obrazkarnia.build.service.SearchService;

import com.tumblr.jumblr.types.Photo;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@Autowired
	HistoryService historyService;

	@RequestMapping("/search")
	public String doSearch(Model model, @RequestParam(name = "tag") String tag,
			Principal principal) {
		
		if (!tag.isEmpty()) {
			
			List<Photo> results = searchService.searchByTag(tag);
			model.addAttribute("photos", results);
			
			if(principal!=null) {
				historyService.addHistory(principal, results);				
			}
			
			return "search-results";
		} else
			return "redirect:index.html";
	}
}
