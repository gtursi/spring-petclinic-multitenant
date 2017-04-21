package org.springframework.samples.petclinic.owner;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
import org.springframework.samples.petclinic.model.BaseEntity;

@Entity
@Table(name = "orders")
public class Order extends BaseEntity {

	private static final long serialVersionUID = 1L;

	public Order() {
    }

    public Order(Date date) {
        this.date = date;
    }

    @Id
    @Column(nullable = false, name = "id")
	@Generated(GenerationTime.INSERT)
    private int id;

    @Column(nullable = false, name = "date")
    private Date date;

	public String toString() {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		return "id: " + id + " - date: " + format1.format(date.getTime());
	}
}
