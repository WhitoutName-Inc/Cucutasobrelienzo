package com.example.museo.controllers;

import com.example.museo.models.Obra;
import com.example.museo.services.ObraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/obras")
public class ObraController {

    @Autowired
    private ObraService obraService;

    @GetMapping
    public List<Obra> listarObras() {
        return obraService.getAllObras();
    }

    @GetMapping("/{id}")
    public Obra obtenerObra(@PathVariable Long id) {
        return obraService.getObraById(id).orElse(null);
    }

    @PostMapping
    public Obra guardarObra(@RequestBody Obra obra) {
        return obraService.saveObra(obra);
    }

    @DeleteMapping("/{id}")
    public void eliminarObra(@PathVariable Long id) {
        obraService.deleteObra(id);
    }
    
    @PutMapping("/{id}")
    public Obra actualizarObra(@PathVariable Long id, @RequestBody Obra obraActualizada) {
        return obraService.getObraById(id).map(obra -> {
        obra.setTituloobra(obraActualizada.getTituloobra());
        obra.setTecnica(obraActualizada.getTecnica());
        obra.setDescripcionobra(obraActualizada.getDescripcionobra());
        obra.setFechapubli(obraActualizada.getFechapubli());
        obra.setArtista(obraActualizada.getArtista());
        obra.setStatus(obraActualizada.getStatus());
        return obraService.saveObra(obra);
        }).orElse(null);
}

}

