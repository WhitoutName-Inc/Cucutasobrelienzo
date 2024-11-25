package com.example.backend.services;

import com.example.backend.models.Coleccion;
import com.example.backend.repositories.ColeccionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ColeccionService {

    @Autowired
    private ColeccionRepository coleccionRepository;

    public List<Coleccion> getAllColecciones() {
        return coleccionRepository.findAll();
    }

    public Optional<Coleccion> getColeccionById(Long id) {
        return coleccionRepository.findById(id);
    }

    public Coleccion saveColeccion(Coleccion coleccion) {
        return coleccionRepository.save(coleccion);
    }

    public void deleteColeccion(Long id) {
        coleccionRepository.deleteById(id);
    }
}

