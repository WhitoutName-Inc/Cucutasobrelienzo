package com.example.backend.controllers;

import com.example.backend.models.Coleccion;
import com.example.backend.services.ColeccionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/colecciones")
public class ColeccionController {

    @Autowired
    private ColeccionService coleccionService;

    @GetMapping
    public List<Coleccion> listarColecciones() {
        return coleccionService.getAllColecciones();
    }

    @GetMapping("/{id}")
    public Coleccion obtenerColeccion(@PathVariable Long id) {
        return coleccionService.getColeccionById(id).orElse(null);
    }

    @PostMapping
    public Coleccion guardarColeccion(@RequestBody Coleccion coleccion) {
        return coleccionService.saveColeccion(coleccion);
    }

    @DeleteMapping("/{id}")
    public void eliminarColeccion(@PathVariable Long id) {
        coleccionService.deleteColeccion(id);
    }
    
    @PutMapping("/{id}")
    public Coleccion actualizarColeccion(@PathVariable Long id, @RequestBody Coleccion coleccionActualizada) {
        return coleccionService.getColeccionById(id).map(coleccion -> {
        coleccion.setNombrecol(coleccionActualizada.getNombrecol());
        coleccion.setDescripcioncol(coleccionActualizada.getDescripcioncol());
        coleccion.setArtista(coleccionActualizada.getArtista());
        coleccion.setObras(coleccionActualizada.getObras());
        coleccion.setStatus(coleccionActualizada.getStatus());
        return coleccionService.saveColeccion(coleccion);
        }).orElse(null);
}

}
