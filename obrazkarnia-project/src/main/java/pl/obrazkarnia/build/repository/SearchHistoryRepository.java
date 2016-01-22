package pl.obrazkarnia.build.repository;

import pl.obrazkarnia.build.entity.SearchHistory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SearchHistoryRepository extends JpaRepository<SearchHistory, Integer>{

}
