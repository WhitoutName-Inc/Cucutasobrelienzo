package com.example.museo.services;

import com.example.museo.models.Status;
import com.example.museo.repositories.StatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StatusService {

    @Autowired
    private StatusRepository statusRepository;

    public List<Status> getAllStatus() {
        return statusRepository.findAll();
    }

    public Optional<Status> getStatusById(Long id) {
        return statusRepository.findById(id);
    }

    public Status saveStatus(Status status) {
        return statusRepository.save(status);
    }

    public void deleteStatus(Long id) {
        statusRepository.deleteById(id);
    }
}

