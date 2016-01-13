package pl.obrazkarnia.build.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.obrazkarnia.build.entity.Blog;
import pl.obrazkarnia.build.entity.User;
import pl.obrazkarnia.build.repository.BlogRepository;
import pl.obrazkarnia.build.repository.UserRepository;


@Service
@Transactional
public class BlogService {

	@Autowired
	BlogRepository blogRepository;
	
	@Autowired
	UserRepository userRepository;

	public void save(Blog blog, String name) {
		User user = userRepository.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);
	}

	public void delete(int id) {
		blogRepository.delete(id);
	}
	
	
}
