package com.example.jusanwallet.Entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "company_type")
@ToString
public class CompanyType {
    @Id
    private int id;
    private String name;
    private double percent;
    @OneToMany(mappedBy = "companyType", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<Company> companies = new ArrayList<>();
    @ToString.Exclude
    @OneToMany(mappedBy = "companyType")
    private List<PlannedCompanyType> clients = new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        return this == o;
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}