package main

import "log"
import "golang.org/x/net/context"
import pb "pb"

func (server *Server) Now(ctx context.Context, in *pb.NowRequest) (*pb.NowResponse, error) {
    log.Printf("Endpoint will return: Now = Night")

    session := server.MongoSession.Copy()
    defer session.Close()

    rating1 := Rating {
        Rating: 15,
    }
    ratingsCollection := session.DB("").C("Ratings")
    err := ratingsCollection.Insert(rating1)
    if err != nil {
        log.Fatal(err)
    }

	return &pb.NowResponse{Msg: "Hello " + in.Msg, Now: "Night"}, nil
}
