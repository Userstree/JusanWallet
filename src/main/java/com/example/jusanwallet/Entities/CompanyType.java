package com.example.jusanwallet.Entities;

import lombok.*;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private double percent;
    @OneToMany(mappedBy = "companyType", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<Company> companies = new ArrayList<>();
    public void addCompany(Company company) {
        companies.add(company);
        company.setCompanyType(this);
    }

    public void removeCompany(Company company) {
        companies.remove(company);
        company.setCompanyType(null);
    }

    @Override
    public boolean equals(Object o) {
        return this == o;
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}