public class Main {
    public static void main(String[] args) {
        ParkingLot lot = new ParkingLot("PL123", 3, 6);
        ParkingService service = new ParkingService();

        // Park Bike
        Vehicle bike = new Vehicle("TN-38-CD-0135", "755070306", VehicleType.BIKE);
        Ticket ticket3 = service.parkVehicle(lot, bike);
        displayParkedVehicleDetails(bike, ticket3);

        // Park Car
        Vehicle car = new Vehicle("TN-38-DJ-1976", "9080280015", VehicleType.CAR);
        Ticket ticket2 = service.parkVehicle(lot, car);
        displayParkedVehicleDetails(car, ticket2);

        // Park Truck
        Vehicle truck = new Vehicle("TN-38-CM-9819", "9894179161", VehicleType.TRUCK);
        Ticket ticket1 = service.parkVehicle(lot, truck);
        displayParkedVehicleDetails(truck, ticket1);

        // Display available slots before unparking
        System.out.println("\n--- Available Slots BEFORE Unparking ---");
        displayAvailableSlots(service, lot);

        // Unpark bike
        service.unparkVehicle(lot, ticket1);
        System.out.println("\nUnparked Vehicle with Ticket ID: " + ticket1.getTicketId());

        // Display available slots after unparking
        System.out.println("\n--- Available Slots AFTER Unparking ---");
        displayAvailableSlots(service, lot);
    }

    private static void displayParkedVehicleDetails(Vehicle vehicle, Ticket ticket) {
        if (ticket != null) {
            System.out.println("\nVehicle Parked:");
            System.out.println("Type       : " + vehicle.getType().getName());
            System.out.println("Reg Number : " + vehicle.getRegistrationNumber());
            System.out.println("Mobile     : " + vehicle.getMobileNumber());
            System.out.println("Ticket ID  : " + ticket.getTicketId());
            System.out.println("Location   : Floor " + ticket.getFloorNumber() + ", Slot " + ticket.getSlotNumber());
        } else {
            System.out.println("\nNo available slot for vehicle type: " + vehicle.getType().getName());
        }
    }

    private static void displayAvailableSlots(ParkingService service, ParkingLot lot) {
        service.displayAvailableSlots(lot, VehicleType.BIKE);
        service.displayAvailableSlots(lot, VehicleType.CAR);
        service.displayAvailableSlots(lot, VehicleType.TRUCK);
    }
}
