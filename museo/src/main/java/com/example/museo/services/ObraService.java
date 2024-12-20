package com.example.museo.services;

import com.example.museo.models.Obra;
import com.example.museo.repositories.ObraRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ObraService {

    @Autowired
    private ObraRepository obraRepository;

    public List<Obra> getAllObras() {
        return obraRepository.findAll();
    }

    public Optional<Obra> getObraById(Long id) {
        return obraRepository.findById(id);
    }

    public Obra saveObra(Obra obra) {
        return obraRepository.save(obra);
    }

    public void deleteObra(Long id) {
        obraRepository.deleteById(id);
    }
}

