public class ParkingService {

    public Ticket parkVehicle(ParkingLot lot, Vehicle vehicle) {
        for (Floor floor : lot.getFloors()) {
            Slot slot = floor.getAvailableSlot(vehicle);
            if (slot != null) {
                slot.park(vehicle);
                return Ticket.generate(lot.getParkingLotId(), floor.getFloorNumber(), slot.getSlotNumber());
            }
        }
        System.out.println("Parking Full for " + vehicle.getType());
        return null;
    }

    public void unparkVehicle(ParkingLot lot, Ticket ticket) {
        int floorIndex = ticket.getFloorNumber() - 1;
        int slotIndex = ticket.getSlotNumber() - 1;

        if (floorIndex < 0 || floorIndex >= lot.getFloors().size()) {
            System.out.println("Invalid floor number.");
            return;
        }

        Floor floor = lot.getFloors().get(floorIndex);
        if (slotIndex < 0 || slotIndex >= floor.getSlots().size()) {
            System.out.println("Invalid slot number.");
            return;
        }

        Slot slot = floor.getSlots().get(slotIndex);
        if (slot.isOccupied()) {
            Vehicle vehicle = slot.getParkedVehicle();
            slot.unpark();
            System.out.println("Vehicle [" + vehicle.getRegistrationNumber() + "] removed from Floor "
                    + ticket.getFloorNumber() + ", Slot " + ticket.getSlotNumber());
        } else {
            System.out.println("Slot is already empty!");
        }
    }

    public void displayAvailableSlots(ParkingLot lot, VehicleType type) {
        System.out.println("Available slots for " + type + ":");
        for (Floor floor : lot.getFloors()) {
            System.out.print("Floor " + floor.getFloorNumber() + ": ");
            boolean anyAvailable = false;
            for (Slot slot : floor.getSlots()) {
                if (!slot.isOccupied() && slot.getVehicleType().equals(type)) {
                    System.out.print(slot.getSlotNumber() + " ");
                    anyAvailable = true;
                }
            }
            if (!anyAvailable) {
                System.out.print("No slots available");
            }
            System.out.println();
        }
    }
}
