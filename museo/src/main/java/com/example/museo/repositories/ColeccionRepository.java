package com.example.museo.repositories;

import com.example.museo.models.Coleccion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ColeccionRepository extends JpaRepository<Coleccion, Long> {
}

