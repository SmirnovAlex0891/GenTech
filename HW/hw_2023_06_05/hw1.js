db.credit.insertOne(
    {id: 1,
    created_at: new Date(),
    credit_name: 'credit for you',
    recipient_id: 234,
    currency: 'usd',
    amount: 5000,
    percent: 2.5,
    credit_term_day: 730,
    is_blocked: false  
    }
)

db.order.insertOne(
    {id: 3,
    created_at: new Date(),
    user_id: 234,
    order_detail_id: 1,
    amount: 150,
    shipper_id: 2,
    is_delivered: false
    }    
)