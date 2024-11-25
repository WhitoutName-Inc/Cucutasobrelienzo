package com.example.backend.controllers;

import com.example.backend.models.Artista;
import com.example.backend.services.ArtistaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/artistas")
public class ArtistaController {

    @Autowired
    private ArtistaService artistaService;

    @GetMapping
    public List<Artista> listarArtistas() {
        return artistaService.getAllArtistas();
    }

    @GetMapping("/{id}")
    public Artista obtenerArtista(@PathVariable Long id) {
        return artistaService.getArtistaById(id).orElse(null);
    }

    @PostMapping
    public Artista guardarArtista(@RequestBody Artista artista) {
        return artistaService.saveArtista(artista);
    }

    @DeleteMapping("/{id}")
    public void eliminarArtista(@PathVariable Long id) {
        artistaService.deleteArtista(id);
    }
    
    @PutMapping("/{id}")
    public Artista actualizarArtista(@PathVariable Long id, @RequestBody Artista artistaActualizado) {
        return artistaService.getArtistaById(id).map(artista -> {
        artista.setNombres(artistaActualizado.getNombres());
        artista.setApellidos(artistaActualizado.getApellidos());
        artista.setTelefono(artistaActualizado.getTelefono());
        artista.setEmail(artistaActualizado.getEmail());
        artista.setEdad(artistaActualizado.getEdad());
        artista.setFotoPerfilUrl(artistaActualizado.getFotoPerfilUrl());
        artista.setDescripcionart(artistaActualizado.getDescripcionart());
        artista.setStatus(artistaActualizado.getStatus());
        return artistaService.saveArtista(artista);
        }).orElse(null);
}

}


