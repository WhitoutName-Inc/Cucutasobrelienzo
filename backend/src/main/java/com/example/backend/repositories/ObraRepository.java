package com.example.backend.repositories;

import com.example.backend.models.Obra;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ObraRepository extends JpaRepository<Obra, Long> {
}

