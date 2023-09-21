#API de conversão de moeda 
gem 'sinatra'
gem 'exchange_rate'

#Definindo as moedas suportadas e suas taxas de câmbio
EXCHANGE_RATES = {
     'USD' => 1.0,
     'EUR' => 0.85,
     'GBR' => 0.75
}

get '/convert' do
     from_currency = params['from']
     to_currency = params['to']
     amount = params['amount'].to_f

     if EXCHANGE_RATES.key?(from_currency) && EXCHANGE_RATES.key?(to_currency)
          converted_amount = amount * (EXCHANGE_RATES[to_currency] / EXCHANGE_RATES[from_currency])
          {amount: converted_amount, currency: to_currency}.to_json
     else
          status 400
          'Moeda nao suporta'
     end
end

