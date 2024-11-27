
package com.example.museo.models;

import jakarta.persistence.*;

@Entity
@Table(name = "tmobra")
public class Obra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idobra;

    @Column(nullable = false)
    private String tituloobra;

    private String fotoObraUrl;

    private String tecnica;

    private String descripcionobra;

    private String fechapubli;

    @ManyToOne(fetch = FetchType.EAGER) // Cambiar a EAGER
    @JoinColumn(name = "fk_idartista", nullable = false)
    private Artista artista;

    @ManyToOne(fetch = FetchType.EAGER) // Cambiar a EAGER
    @JoinColumn(name = "fk_cods", nullable = false)
    private Status status;


    // Getters y Setters

    public Long getIdobra() {
        return idobra;
    }

    public void setIdobra(Long idobra) {
        this.idobra = idobra;
    }

    public String getTituloobra() {
        return tituloobra;
    }

    public void setTituloobra(String tituloobra) {
        this.tituloobra = tituloobra;
    }

    public String getFotoObraUrl() {
        return fotoObraUrl;
    }

    public void setFotoObraUrl(String fotoObraUrl) {
        this.fotoObraUrl = fotoObraUrl;
    }

    public String getTecnica() {
        return tecnica;
    }

    public void setTecnica(String tecnica) {
        this.tecnica = tecnica;
    }

    public String getDescripcionobra() {
        return descripcionobra;
    }

    public void setDescripcionobra(String descripcionobra) {
        this.descripcionobra = descripcionobra;
    }

    public String getFechapubli() {
        return fechapubli;
    }

    public void setFechapubli(String fechapubli) {
        this.fechapubli = fechapubli;
    }

    public Artista getArtista() {
        return artista;
    }

    public void setArtista(Artista artista) {
        this.artista = artista;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }


    
    
}
