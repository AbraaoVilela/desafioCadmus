class Usuarios
    include HTTParty
    include RSpec::Matchers
    
    base_uri SCHEMA["uri"]
    
    def pegarTodosUsuarios
        response = self.class.get(ENDPOINTS["users"])
        response["data"][0]["id"]
    end

    def pegarUsuarios(usuarios)
        self.class.get(ENDPOINTS["users"] + "?name=" + usuarios)
    end

    def pegarPrimeiroUsuario(id)
        self.class.get(ENDPOINTS["users"] + "/" + id.to_s + ENDPOINTS["posts"])
    end

    def formatarJsonUsuario
        json = File.read('features/templates/post_create_user.json')
        json_parsed = JSON.parse(json)
        json_parsed['name'] = Faker::Name.name
        json_parsed['email'] = Faker::Internet.email
        json_parsed['gender'] = Faker::Gender.binary_type
        payload = json_parsed
    end

    def formatarJsonParaAtualizarOUsuario
        json = File.read('features/templates/put_update_user.json')
        json_parsed = JSON.parse(json)
        json_parsed['name'] = Faker::Name.name + " Update"
        json_parsed['email'] = Faker::Internet.email
        payload = json_parsed
    end

    def criacaoUsuario(payload)
        auth = AUTH['bearer_token']
        self.class.post(ENDPOINTS['users'], headers: { "Authorization" => "Bearer #{auth}"}, body: payload)
    end

    def atualizarUsuario(usuarioCriado, payload)
        auth = AUTH['bearer_token']
        id = usuarioCriado["data"]["id"]
        self.class.put(ENDPOINTS['users'] + "/#{id}", headers: { "Authorization" => "Bearer #{auth}"}, body: payload)
    end

    def deletarUsuario(usuarioCriado)
        auth = AUTH['bearer_token']
        id = usuarioCriado["data"]["id"]
        self.class.delete(ENDPOINTS['users'] + "/#{id}", headers: { "Authorization" => "Bearer #{auth}"})
    end

    def verificarOsDetalhesDoUsuario(usuarioNaik)
        expect(usuarioNaik.code).to eq 200

        data = usuarioNaik["data"]
        number = data.length
        var = 0

        until var == number do
            expect(data[var]["name"]).to include("Naik")
            puts data[var]["name"]
            var += 1
        end
        
    end 

    def criacaoDoUsuario(primeiroId)
        expect(first_id.code).to eq 200
        expect(first_id).to include("data")
    end

    def criacaoDoUsuarioComTodosAtributos(usuarioCriado)
        expect(usuarioCriado.code).to eq 200
        expect(usuarioCriado["code"]).to eq 201
        puts "ID: #{usuarioCriado["data"]["id"]}"
        puts "Nome: #{usuarioCriado["data"]["name"]}"
        puts "E-mail: #{usuarioCriado["data"]["email"]}"
        puts "Sexo: #{usuarioCriado["data"]["gender"]}"
        puts "Status: #{usuarioCriado["data"]["status"]}"
    end

    def atualzarUsuarioComSucesso(usuarioAtualizado)
        expect(usuarioAtualizado.code).to eq 200
        expect(usuarioAtualizado["code"]).to eq 200
    end

    def deletarUsuarioComSucesso(usuarioDeletado)
        expect(usuarioDeletado.code).to eq 200
        expect(usuarioDeletado["code"]).to eq 204
    end
end