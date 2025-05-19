public class Slot {
    private final int slotNumber;
    private final VehicleType vehicleType;
    private Vehicle parkedVehicle;

    public Slot(int slotNumber, VehicleType vehicleType) {
        this.slotNumber = slotNumber;
        this.vehicleType = vehicleType;
    }

    public int getSlotNumber() {
        return slotNumber;
    }

    public VehicleType getVehicleType() {
        return vehicleType;
    }

    public boolean isOccupied() {
        return parkedVehicle != null;
    }

    public void park(Vehicle vehicle) {
        this.parkedVehicle = vehicle;
    }

    public void unpark() {
        this.parkedVehicle = null;
    }

    public Vehicle getParkedVehicle() {
        return parkedVehicle;
    }
}
