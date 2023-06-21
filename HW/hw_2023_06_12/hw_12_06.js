db.transactions.insertMany(
    [{id: 1,
    created_at: new Date(),
    recipient_id: 'c001',
    sender_id: 'c002',
    amount: 100,
    currency: 'eur',
    is_finished: true},
    {id: 1,
    created_at: new Date(),
    recipient_id: 'c002',
    sender_id: 'c001',
    amount: 150,
    currency: 'eur'
    },
    {id: 1,
    created_at: new Date(),
    recipient_id: 'c002',
    sender_id: 'c001',
    amount: 200,
    currency: 'eur',
    is_finished: true}]
)

db.transactions.find(
    {is_finished: true, amount: {$gte: 150}}
)

db.clients.find(
    {is_blocked: {$ne: true}, country: {$in: ['Germany', 'China']}, balance: {$lte: 10000}}
)
db.clients.insertMany(
    [
        {id: 'c003',
        created_at: new Date(),
        fullname: 'Adam Vozniak',
        country: 'China',
        balance: 500},
        {id: 'c004',
        created_at: new Date(),
        fullname: 'Pol Vazoski',
        country: 'China',
        balance: 600,
        is_blocked: true},
        {id: 'c005',
        created_at: new Date(),
        fullname: 'Nik Keyge',
        country: 'Germany',
        balance: 900,
        is_blocked: true}
        ]
)

db.calls.updateMany(
    {duration_secs: {$lte: 60 * 60}},
    {$pull: {topics: {$in: ['money', 'important']}}}
)
db.calls.updateMany(
    {},
    {$addToSet: {topics: {$each: ['checked', 'new']}}}
)