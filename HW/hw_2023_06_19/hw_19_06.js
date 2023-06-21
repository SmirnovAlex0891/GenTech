//Вывести одного юзера с самым большим балансом (проекция: имя)
db.users.aggregate([
    {$sort: {balance: -1}},
    {$limit: 1},
    {$project: {_id: 0, fullname: 1}}
])

//Указать юзерам 1 и 2 страну USA
db.users.updateMany(
    {user_id: {$in: [1, 2]}},
    {$set: {country: 'USA'}}
)

//Вывести все транзакции, где получателем являются юзеры из USA
db.transactions.aggregate([
    {$lookup: {from: 'users', localField: 'recipient_id', foreignField: 'user_id', as: 'recipient'}},
    {$unwind: '$recipient'},
    {$match: {'recipient.country': 'USA'}}    
])

//Вывести все USD-транзакции незаблокированных юзеров не из USA
db.transactions.aggregate([
    {$match: {currency: 'usd'}},
    {$lookup: {from: 'users', localField: 'sender_id', foreignField: 'user_id', as: 'sender'}},
    {$lookup: {from: 'users', localField: 'recipient_id', foreignField: 'user_id', as: 'recipient'}},
    {$match: {'sender.is_blocked': {$ne: true}, 'sender.country': {$ne: 'USA'}, 'recipient.is_blocked': {$ne: true}, 'recipient.country': {$ne: 'USA'}}}
])

//Вывести все транзакции, где отправителем являются юзеры не из USA
db.transactions.aggregate([
    {$lookup: {from: 'users', localField: 'sender_id', foreignField: 'user_id', as: 'sender'}},
    {$unwind: '$sender'},
    {$match: {'sender.country': {$ne: 'USA'}}}
])


