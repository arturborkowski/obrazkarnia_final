package pl.obrazkarnia.build.service;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.obrazkarnia.build.entity.Image;
import pl.obrazkarnia.build.entity.SearchHistory;
import pl.obrazkarnia.build.entity.User;
import pl.obrazkarnia.build.repository.UserRepository;

import com.tumblr.jumblr.types.Photo;

@Service
@Transactional
public class HistoryService {

	@Autowired
	UserRepository userRepository;
	
	

	
	@Transactional
	public void addHistory(Principal principal, List<Photo> results) {

		User user = userRepository.findByName(principal.getName());
		if(user.getHistory()==null){
			SearchHistory history = new SearchHistory();
			user.setHistory(history);
			history.setUser(user);
		}		
		
		for (Photo p : results) {
			Image im = new Image();
			im.setUrl(p.getOriginalSize().getUrl());
			im.setDatePublished(new Date());
			user.getHistory().getImages().add(im);
		}
		System.out.println(user.getHistory().getImages().size());
	}

}
