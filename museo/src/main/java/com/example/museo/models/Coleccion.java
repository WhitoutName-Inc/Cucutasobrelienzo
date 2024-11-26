package com.example.museo.models;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "tmcoleccion")
public class Coleccion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcoleccion;

    private String nombrecol;

    @Column(length = 500)
    private String descripcioncol;

    @ManyToOne
    @JoinColumn(name = "fk_idartista", nullable = false)
    private Artista artista;

    @ManyToMany
    @JoinTable(
        name = "coleccion_obras",
        joinColumns = @JoinColumn(name = "coleccion_id"),
        inverseJoinColumns = @JoinColumn(name = "obra_id")
    )
    private List<Obra> obras;

    @ManyToOne
    @JoinColumn(name = "fk_cods", nullable = false)
    private Status status;

    public Long getIdcoleccion() {
        return idcoleccion;
    }

    public void setIdcoleccion(Long idcoleccion) {
        this.idcoleccion = idcoleccion;
    }

    public String getNombrecol() {
        return nombrecol;
    }

    public void setNombrecol(String nombrecol) {
        this.nombrecol = nombrecol;
    }

    public String getDescripcioncol() {
        return descripcioncol;
    }

    public void setDescripcioncol(String descripcioncol) {
        this.descripcioncol = descripcioncol;
    }

    public Artista getArtista() {
        return artista;
    }

    public void setArtista(Artista artista) {
        this.artista = artista;
    }

    public List<Obra> getObras() {
        return obras;
    }

    public void setObras(List<Obra> obras) {
        this.obras = obras;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
    
    

}

