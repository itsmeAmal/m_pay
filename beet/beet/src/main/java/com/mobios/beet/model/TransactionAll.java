	package com.mobios.beet.model;

    import org.springframework.data.jpa.domain.support.AuditingEntityListener;

    import javax.persistence.*;

    @Entity
    @Table(name="transactions_all")
    @EntityListeners(AuditingEntityListener.class)


    @NamedQuery(name="TransactionAll.findTransaction",
    query="select tran from TransactionAll tran where tran.tId= ?1")

    @NamedQuery(name="TransactionAll.updateTransStatus",
    query="UPDATE TransactionAll t SET t.status=?1 WHERE t.tId = ?2 AND t.entry= ?3")

    /*@NamedQuery(name="TransactionAll.findTranByTid",
    query="select tId ,transactionTypesId , entry, date,amount,description,GROUP_CONCAT(userAccNo SEPARATOR ', ') AS userAccNo , status, balanceAmount,merchantCategoryCode from TransactionAll where tId=?1 group by tId")
    */

    public class TransactionAll {

        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)

            private int id;

        @Column(name = "t_id")
            private String tId;

        @Column(name = "transaction_types_id")
            private String transactionTypesId;

        @Column(name = "entry")
            private String entry;

        @Column(name = "date")
            private String date;

        @Column(name = "amount")
            private String amount;

        @Column(name = "description")
            private String description;

        @Column(name = "user_acc_no")
            private String userAccNo;

        @Column(name = "status")
            private String status;

        @Column(name = "balance_amount")
            private double balanceAmount;

        @Column(name="merchant_category_code")
            private String merchantCategoryCode;

        public String getMerchantCategoryCode() {
            return merchantCategoryCode;
        }

        public void setMerchantCategoryCode(String merchantCategoryCode) {
            this.merchantCategoryCode = merchantCategoryCode;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String gettId() {
            return tId;
        }

        public void settId(String tId) {
            this.tId = tId;
        }

        public String getTransactionTypesId() {
            return transactionTypesId;
        }

        public void setTransactionTypesId(String transactionTypesId) {
            this.transactionTypesId = transactionTypesId;
        }

        public String getEntry() {
            return entry;
        }

        public void setEntry(String entry) {
            this.entry = entry;
        }

        public String getDate() {
            return date;
        }

        public void setDate(String date) {
            this.date = date;
        }

        public String getAmount() {
            return amount;
        }

        public void setAmount(String amount) {
            this.amount = amount;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }

        public String getUserAccNo() {
            return userAccNo;
        }

        public void setUserAccNo(String userAccNo) {
            this.userAccNo = userAccNo;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public double getBalanceAmount() {
            return balanceAmount;
        }

        public void setBalanceAmount(double balanceAmount) {
            this.balanceAmount = balanceAmount;
        }





    }
