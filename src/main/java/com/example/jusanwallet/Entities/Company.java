package com.example.jusanwallet.Entities;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "company")
@ToString
public class Company {
    @Id
    private int id;
    private String name;
    @ManyToOne
    @JoinColumn(name = "company_type_id")
    private CompanyType companyType;
    @OneToMany(mappedBy = "company", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<Transaction> transactions = new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        return this == o;
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}