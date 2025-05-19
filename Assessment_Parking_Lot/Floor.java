import java.util.List;

public class Floor {
    private final int floorNumber;
    private final List<Slot> slots;

    public Floor(int floorNumber, List<Slot> slots) {
        this.floorNumber = floorNumber;
        this.slots = slots;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public List<Slot> getSlots() {
        return slots;
    }

    public Slot getAvailableSlot(Vehicle vehicle) {
        for (Slot slot : slots) {
            if (!slot.isOccupied() && slot.getVehicleType().equals(vehicle.getType())) {
                return slot;
            }
        }
        return null;
    }
}
