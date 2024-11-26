package com.example.museo.models;

import jakarta.persistence.*;

@Entity
@Table(name = "tmstatus")
public class Status {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long cods;

    @Column(name = "des_status", nullable = false, length = 100)
    private String desStatus;

    @Column(name = "create_time", nullable = false)
    private String createTime;

    public Long getCods() {
        return cods;
    }

    public void setCods(Long cods) {
        this.cods = cods;
    }

    public String getDesStatus() {
        return desStatus;
    }

    public void setDesStatus(String desStatus) {
        this.desStatus = desStatus;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    
}
