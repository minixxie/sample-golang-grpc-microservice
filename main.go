package main

import (
    "net"
    "log"
    "golang.org/x/net/context"
    "google.golang.org/grpc"
    pb "pb"
)

const (
	port = ":80"
)

type server struct{}

func (s *server) Now(ctx context.Context, in *pb.NowRequest) (*pb.NowResponse, error) {
    log.Printf("Endpoint will return: Now = Night")
	return &pb.NowResponse{Msg: "Hello " + in.Msg, Now: "Night"}, nil
}

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	pb.RegisterTimeServiceServer(s, &server{})
//	// Register reflection service on gRPC server.
//	reflection.Register(s)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
