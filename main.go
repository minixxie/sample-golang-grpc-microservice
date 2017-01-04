package main

import (
    "net"
    "log"
    "google.golang.org/grpc"
    pb "./pb"
)

const (
	port = ":10000"
)

type server struct{}

//func (s *server) Now(ctx context.Context, in *pb.NowRequest) (*pb.NowResponse, error) {
//	return &pb.NowResponse{Msg: "Hello " + in.Msg, Now: "Night"}, nil
//}

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
//	pb.RegisterGreeterServer(s, &server{})
//	pb.init()
//	// Register reflection service on gRPC server.
//	reflection.Register(s)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
