package com.example.jusanwallet.Services;

import com.example.jusanwallet.Entities.Client;
import com.example.jusanwallet.Repositories.ClientRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ClientService {
    private final ClientRepository clientRepository;

    public ClientService(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }
    @Transactional
    public Client findById(int clientID) {
        return clientRepository.findById(clientID).orElse(null);
    }
}
