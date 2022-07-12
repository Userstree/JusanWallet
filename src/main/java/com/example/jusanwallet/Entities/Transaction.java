package com.example.jusanwallet.Entities;

import lombok.*;
import org.springframework.data.relational.core.mapping.Table;

import javax.persistence.*;
import java.util.Date;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "transaction")
@ToString
public class Transaction {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    @Column(name = "monetary", nullable = false)
    private double monetary;
    private double bonus;
    private Date date;
    @ManyToOne
    @JoinColumn(name = "client_ID", referencedColumnName = "id")
    private Client client = null;
    @ManyToOne
    @JoinColumn(name = "company_ID", referencedColumnName = "id")
    private Company company = null;
    @ManyToOne
    @JoinColumn(name = "category_ID", referencedColumnName = "id")
    private Category category = null;

    @Override
    public boolean equals(Object o) {
        return this == o;
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
