package pl.obrazkarnia.build.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

import pl.obrazkarnia.build.annotation.UniqueUsername;


@Entity
public class User {

	@Id
	@GeneratedValue
	private Integer id;
	
	@Size(min=3, message="Username must have at least 3 characters.")
	@Column(unique=true)
	@UniqueUsername(message="Such username already exists.")
	private String name;
	
	@Size(min=5, message="Password must have at least 3 characters.")
	private String password;
	
	private String confirmPassword;
	
	@Size(min=1, message="Invalid email address.")
	@Email(message="Invalid email address.")
	private String email;
	
	private boolean enabled;   // indicates if the user is able to login or not
	
	
	@ManyToMany
	@JoinTable
	private List<Role> roles;
	
	@OneToMany(mappedBy = "user", cascade=CascadeType.REMOVE)
	private List<Blog> blogs;
	
	@OneToOne(mappedBy="user", cascade=CascadeType.ALL)
	private SearchHistory history;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public List<Blog> getBlogs() {
		return blogs;
	}

	public void setBlogs(List<Blog> blogs) {
		this.blogs = blogs;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public SearchHistory getHistory() {
		return history;
	}

	public void setHistory(SearchHistory history) {
		this.history = history;
	}
	
	
}
