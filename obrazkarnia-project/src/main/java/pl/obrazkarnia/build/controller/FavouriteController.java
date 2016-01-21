package pl.obrazkarnia.build.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FavouriteController {

    @RequestMapping("/favourite")
    public String favourite() {
        return "favourite";
    }
}
