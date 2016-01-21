package pl.obrazkarnia.build.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pl.obrazkarnia.build.service.SearchService;


@Controller
public class SearchController {

	@Autowired
	SearchService searchService;

	@RequestMapping("/search")
	public String doSearch(Model model, @RequestParam(name = "tag") String tag) {
		if (!tag.isEmpty()) {
			model.addAttribute("photos", searchService.searchByTag(tag));
			return "search-results";
		} else
			return "redirect:index.html";
	}
}
