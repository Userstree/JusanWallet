package com.example.jusanwallet.Entities;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.Hibernate;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "planned_company_types")
@ToString
@RequiredArgsConstructor
public class PlannedCompanyType {
    @Id
    private int id;

    @ManyToOne
    @JoinColumn(name = "client_id")
    Client client;

    @ManyToOne
    @JoinColumn(name = "company_type_id")
    CompanyType companyType;

    double plan;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        PlannedCompanyType that = (PlannedCompanyType) o;
        return false;
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
