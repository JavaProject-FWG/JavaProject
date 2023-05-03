package com.team.forum.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.team.forum.models.Theme;

@Repository
public interface ThemeRepository extends CrudRepository<Theme, Long> {

	List<Theme> findAll();

}
