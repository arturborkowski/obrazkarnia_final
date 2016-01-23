package pl.obrazkarnia.build.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.stereotype.Service;


import com.tumblr.jumblr.JumblrClient;
import com.tumblr.jumblr.types.Photo;
import com.tumblr.jumblr.types.PhotoPost;
import com.tumblr.jumblr.types.Post;

@Service
public class SearchService {

	
	
	// Authenticate via OAuth
	JumblrClient client = new JumblrClient(
	  "C2sv75Qqcqs7cYCtjuTaxwn2ClA1zgT3e3aWYt1ECiSDwLMBtg",
	  "T5Kv2Nfv4BKakIqYMcJfyytubs69vZqwP6d56fm0J6hGMBkrBb", 
	  "XitTz7aiXuP51wKrwomV0R004tjZ0lLQ8hIMNoVrO3fwdzTuT6",
	  "KgEMyv6ksdEdCktr4RV4Y70lHcArvyc6f3lvYQ0kRUFQydEujt"
	);
	
	
	public List<Photo> searchByTag(String tag) {
		
		List<Photo> photos = new ArrayList<Photo>();
		List<PhotoPost> fotoposty = new ArrayList<PhotoPost>();
		List<Post> posty = client.tagged(tag);
		for(Post post : posty) {
			if(post.getType().equals("photo")) {
				fotoposty.add((PhotoPost) post);
			}
		}
		
		for(PhotoPost photopost : fotoposty) {
			for(Photo photo : photopost.getPhotos()) {
				photos.add(photo);
				System.out.println(photo.getOriginalSize().getUrl());
			}
		}
		
		return photos;
	}
	
	
}
