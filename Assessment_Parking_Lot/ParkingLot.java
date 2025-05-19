import java.util.*;

public class ParkingLot {
    private final String parkingLotId;
    private final List<Floor> floors;

    public ParkingLot(String parkingLotId, int numFloors, int slotsPerFloor) {
        this.parkingLotId = parkingLotId;
        this.floors = new ArrayList<>();

        for (int i = 1; i <= numFloors; i++) {
            VehicleType typeForFloor;

            if (i == 1) {
                typeForFloor = VehicleType.TRUCK;
            } else if (i == 2) {
                typeForFloor = VehicleType.CAR;
            } else if (i == 3) {
                typeForFloor = VehicleType.BIKE;
            } else {
                throw new IllegalArgumentException("Floor " + i + " not configured with a vehicle type.");
            }

            List<Slot> slots = new ArrayList<>();
            for (int j = 1; j <= slotsPerFloor; j++) {
                slots.add(new Slot(j, typeForFloor));
            }

            floors.add(new Floor(i, slots)); // ✅ Make sure Floor class has a constructor Floor(int, List<Slot>)
        }
    }

    public String getParkingLotId() {
        return parkingLotId;
    }

    public List<Floor> getFloors() {
        return floors;
    }
}
