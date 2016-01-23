package pl.obrazkarnia.build.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.obrazkarnia.build.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);

}
