package com.example.backend.controllers;

import com.example.backend.models.Status;
import com.example.backend.services.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/status")
public class StatusController {

    @Autowired
    private StatusService statusService;

    @GetMapping
    public List<Status> listarStatus() {
        return statusService.getAllStatus();
    }

    @GetMapping("/{id}")
    public Status obtenerStatus(@PathVariable Long id) {
        return statusService.getStatusById(id).orElse(null);
    }

    @PostMapping
    public Status guardarStatus(@RequestBody Status status) {
        return statusService.saveStatus(status);
    }

    @DeleteMapping("/{id}")
    public void eliminarStatus(@PathVariable Long id) {
        statusService.deleteStatus(id);
    }
    
    @PutMapping("/{id}")
    public Status actualizarStatus(@PathVariable Long id, @RequestBody Status statusActualizado) {
        return statusService.getStatusById(id).map(status -> {
        status.setDesStatus(statusActualizado.getDesStatus());
        status.setCreateTime(statusActualizado.getCreateTime());
        return statusService.saveStatus(status);
        }).orElse(null);
}

}

