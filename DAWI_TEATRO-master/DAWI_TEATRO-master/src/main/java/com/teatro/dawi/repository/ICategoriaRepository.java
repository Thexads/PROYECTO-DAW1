package com.teatro.dawi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.teatro.dawi.model.Categoria;

@Repository
public interface ICategoriaRepository extends JpaRepository<Categoria, Integer> {

}
