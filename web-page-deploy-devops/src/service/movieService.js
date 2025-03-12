import {
    SecretsManagerClient,
    GetSecretValueCommand,
  } from "@aws-sdk/client-secrets-manager";
  
const secretName = "tmdb_api";
const URLMovie = "https://api.themoviedb.org/3/movie/{}?language=en-US";

export async function movieService() {
    const client = new SecretsManagerClient({
        region: "us-east-1",
    });

    try {
        const response = await client.send(
            new GetSecretValueCommand({
                SecretId: secretName,
                VersionStage: "AWSCURRENT", // VersionStage defaults to AWSCURRENT if unspecified
            })
        );
        
        const secret = response.SecretString;
        const request = new Request(URLMovie);
        const headers = new Headers();
        headers.append("Authorization", `Bearer ${secret}`);
    
        const result = await fetch(request, headers)
            .then(resp => {
                if (resp.status != "200") {
                    throw Error(`Bad request: ${resp.statusText}`)
                }
                return resp.json();
            });
    
        const movieName = result["title"];
        return movieName;
    } catch (error) {
        console.log(error);
        throw error;
    }
}



// Your code goes here



