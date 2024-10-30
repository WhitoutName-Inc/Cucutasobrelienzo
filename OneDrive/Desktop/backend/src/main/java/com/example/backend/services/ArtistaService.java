package com.example.backend.services;

import com.example.backend.models.Artista;
import com.example.backend.repositories.ArtistaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ArtistaService {

    @Autowired
    private ArtistaRepository artistaRepository;

    public List<Artista> getAllArtistas() {
        return artistaRepository.findAll();
    }

    public Optional<Artista> getArtistaById(Long id) {
        return artistaRepository.findById(id);
    }

    public Artista saveArtista(Artista artista) {
        return artistaRepository.save(artista);
    }

    public void deleteArtista(Long id) {
        artistaRepository.deleteById(id);
    }
}
