package main

import "net"
import "log"
import "os"
import "google.golang.org/grpc"
import pb "pb"
import "gopkg.in/mgo.v2"

const port = ":80"

type Server struct{
    MongoSession *mgo.Session
}

func main() {
    mongoUri := os.Getenv("MONGO_URI")
    log.Println("Pkg mgo is using MONGO_URI: ", mongoUri)
    if mongoUri == "" {
        log.Fatalf("Please specify environment variable MONGO_URI")
    }

    dialInfo, err := mgo.ParseURL(mongoUri)
    if err != nil {
        log.Println("Failed to parse URI: ", err)
        panic(err)
    }

    session, err := mgo.DialWithInfo(dialInfo)
    if err != nil {
        panic(err)
    }
    server := Server {
        MongoSession: session,
    }

	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
    log.Println("Listening gRPC at port ", port)
	s := grpc.NewServer()
	pb.RegisterTimeServiceServer(s, &server)
//	// Register reflection service on gRPC server.
//	reflection.Register(s)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
