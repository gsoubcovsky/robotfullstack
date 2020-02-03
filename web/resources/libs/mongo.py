from pymongo import MongoClient

cliente = MongoClient('mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=true&w=majority')
db = cliente['spotdb']

def remove_company(company):
    spots = db['spots']
    spots.delete_many({'company': company})
